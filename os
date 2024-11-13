//sjf
#include<stdio.h>

#include<limits.h>



struct Process

{

 int pid;

 int arrival;

 int burst;

 int remaining;

 int completion;

};

void sjf_premptive(struct Process processes[],int n)

{

 int time=0,completed=0;

 int total_wait=0,total_turnaround=0;

 

 while(completed<n)

 {

  int min_index=-1,min_remaining=INT_MAX;

  for(int i=0;i<n;i++)

  {

   if(processes[i].arrival<=time && processes[i].remaining>0 && processes[i].remaining<min_remaining)

   {

    min_remaining=processes[i].remaining;

    min_index=i;

   }

  }

  if(min_index!=-1)

  {

   processes[min_index].remaining--;

   if(processes[min_index].remaining==0)

   {

    completed++;

    processes[min_index].completion=time+1;

    int turnaround=processes[min_index].completion-processes[min_index].arrival;

    int waiting=turnaround-processes[min_index].burst;

    total_turnaround+=turnaround;

    total_wait+=waiting;

   }

   time++;

   }

   else

   {

    time++;

   }

  }

  printf("\nPID\tArrival\tBurst\t\tCompletion\tTurnaround\tWaiting\n");

  for(int i=0;i<n;i++)

  {

   int turnaround=processes[i].completion-processes[i].arrival;

    int waiting=turnaround-processes[i].burst;

    printf("%d\t%d\t%d\t%d\t\t%d\t\t%d\n",processes[i].pid,processes[i].arrival,processes[i].burst,processes[i].completion,turnaround,waiting);

   }

   printf("Average Turnaround Time:%.2f\n",(float)total_turnaround/n);

   printf("Average Waiting Time:%.2f\n",(float)total_wait/n);

  }

  int main()

  {

   int n;

   printf("Enter the number of processes:");

   scanf("%d",&n);

   

   struct Process processes[n];

   for(int i=0;i<n;i++)

   {

    processes[i].pid=i+1;

    printf("Enter the arrival and burst time for process %d:",processes[i].pid);

    scanf("%d%d",&processes[i].arrival,&processes[i].burst);

    processes[i].remaining=processes[i].burst;

   }

   sjf_premptive(processes,n);

   return 0;

  }      

 
