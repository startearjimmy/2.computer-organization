#include <iostream>
#include <math.h>
#include <vector>
using namespace std;

struct cache_content{
	bool v;
	unsigned int  tag; 
//	unsigned int	data[16];
};

const int K=1024;
//KB=1024 bytes
//byte=8bits

void simulate(int cache_size, int block_size, int associativity){
	unsigned int tag,index,x;
	int i=0,j;
	int offset_bit = (int) log2(block_size);
	int index_bit = (int) log2(cache_size/block_size);
	int line= cache_size>>(offset_bit);
	int *k=new int [10];
	cache_content *cache=new cache_content [line];
	cout<<"cache size(KB):"<<cache_size/1024<<endl;
	cout<<"block size(B):"<<block_size<<endl;
	cout<<"associativity:"<<associativity<<endl;
	cout<<"cache line(block number):"<<line<<endl;
	cout<<"set:"<<line/associativity<<endl;
	
	for(int j=0;j<line;j++)
		cache[j].v=false;
	
  FILE * fp=fopen("Trace.txt","r");					//read file
	vector<int> hit_instr;
	vector<int> miss_instr;
	hit_instr.assign(1,0);// sizeÒªœp1 
	miss_instr.assign(1,0);// sizeÒªœp1 
//	while(fscanf(fp,"%x",&x)!=EOF){
////		cout<<hex<<x<<" ";
//		index=(x>>offset_bit)&(line-1);
//		tag=x>>(index_bit+offset_bit);
////		cout<<index<<" "<<(index>> (int) log2(associativity))<<" "<<(index<< (int) log2(associativity))+0<<endl;
//		if(cache[index].v && cache[index].tag==tag){
//			cache[index].v=true; 			//hit
//			hit_instr.push_back(i);
////			cout<<"hit "<<hit_instr.size()-1<<endl;
//		}
//		else{						
//			cache[index].v=true;			//miss
//			cache[index].tag=tag;
//			miss_instr.push_back(i);
////			cout<<"miss "<<miss_instr.size()-1<<endl;
//		}
//		i++; 
//	}
	while(fscanf(fp,"%x",&x)!=EOF)
	{
//		cout<<hex<<x<<" ";
		bool hit=false,no_space=true;
		index=((x>>offset_bit)&(line-1))>>(int)log2(associativity);
		tag=x>>(index_bit+offset_bit);
//		cout<<((x>>offset_bit)&(line-1))<<" "<<(index<<(int)log2(associativity))<<endl;
		for(j=0;j<associativity;j++)
		{
//			cout<<cache[(index<<(int)log2(associativity))+j].v<<endl;
			if(cache[(index<<(int)log2(associativity))+j].v && cache[(index<<(int)log2(associativity))+j].tag==tag)
			{
//				cache[(index<<(int)log2(associativity))+j].v=true; 			//hit
				hit_instr.push_back(i);
				hit=true;
//				cout<<"hit "<<hit_instr.size()-1<<endl;
				break;
			}	
		}
		if(!hit)
		{
			for(j=0;j<associativity;j++)
			{
				if(!cache[(index<<(int)log2(associativity))+j].v)
				{
					cache[(index<<(int)log2(associativity))+j].v=true;			//miss
					cache[(index<<(int)log2(associativity))+j].tag=tag;
					miss_instr.push_back(i);
//					cout<<"miss "<<miss_instr.size()-1<<endl;
					no_space=false;
					break;
				}
			}
			if(no_space)
			{
				cache[((x>>offset_bit)&(line-1))].v=true;			//miss
				cache[((x>>offset_bit)&(line-1))].tag=tag;
				miss_instr.push_back(i);
//				cout<<"miss "<<miss_instr.size()-1<<endl;
			}
		}
		i++; 
	}
	cout<<"Hits instructions: ";
	for(j=1;j<hit_instr.size();j++) cout<<hit_instr.at(j)+1<<',';
	cout<<endl;
	cout<<"Misses instructions: ";
	for(j=1;j<miss_instr.size();j++) cout<<miss_instr.at(j)+1<<',';
	cout<<endl;
	float miss_rate=((float)100*(miss_instr.size()-1)/i);
	cout.precision(5);
	cout<<"Miss rate:"<<miss_rate<<'%'<<endl;
	fclose(fp);

	delete [] cache;

}
	
int main(){
	// Let us simulate 4KB cache with 16B blocks
	simulate(4*K, 16, 1); //cache size(KB), block size(B), associativity
}
