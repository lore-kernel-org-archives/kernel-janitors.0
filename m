From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 20:37:25 +0000
Subject: Re: [PATCH] cpupower: Combine two condition checks into one statement in get_cpu_topology()
Message-Id: <a131b1b8-739f-67d6-3cf4-b9d87f4e7c20@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3daea226-c5cb-62e7-a025-8f758712a81a@users.sourceforge.net>
 <372aa4f8-7e97-ee83-1078-6f80e28ffdf0@kernel.org>
In-Reply-To: <372aa4f8-7e97-ee83-1078-6f80e28ffdf0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shuah@kernel.org, linux-pm@vger.kernel.org, Thomas Renninger <trenn@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

>> @@ -140,18 +140,12 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
>>  	for (cpu = 0; cpu < cpus; cpu++) {
>>  		cpu_top->core_info[cpu].cpu = cpu;
>>  		cpu_top->core_info[cpu].is_online = cpupower_is_cpu_online(cpu);
>> -		if(sysfs_topology_read_file(
>> -			cpu,
>> -			"physical_package_id",
>> -			&(cpu_top->core_info[cpu].pkg)) < 0) {
>> -			cpu_top->core_info[cpu].pkg = -1;
>> -			cpu_top->core_info[cpu].core = -1;
>> -			continue;
>> -		}
>> -		if(sysfs_topology_read_file(
>> -			cpu,
>> -			"core_id",
>> -			&(cpu_top->core_info[cpu].core)) < 0) {
>> +		if (sysfs_topology_read_file(cpu, "physical_package_id",
>> +					     &(cpu_top->core_info[cpu].pkg))
>> +		    < 0 ||
>> +		    sysfs_topology_read_file(cpu, "core_id",
>> +					     &(cpu_top->core_info[cpu].core))
>> +		    < 0) {
> 
> This change takes the easily readable code into hard to read code,

I got other views around code readability for the shown software
design direction.


> even though it removes the duplicate code in the conditional.

Would you like to reduce a bit of duplicate code here?


> Please find a better way to make it not so hard to read.

Which source code layout would you find more appropriate then
in this use case?

Regards,
Markus
