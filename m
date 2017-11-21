From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 21 Nov 2017 18:55:25 +0000
Subject: Re: [PATCH] selftest: sync: Use common error handling code in sync_file_info()
Message-Id: <29abb1d8-95dd-fdf3-cecb-40d6c035508c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <219c366b-d753-e65b-b021-6d4a584588d0@users.sourceforge.net>
 <3a27095e-84ad-6e93-bae5-3b242a042238@kernel.org>
In-Reply-To: <3a27095e-84ad-6e93-bae5-3b242a042238@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>> Add a jump target so that a bit of exception handling can be better reused
>> at the end of this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
> I would like to see the Coccinelle log included in the commit log

I guess that I can not append the kind of report you might be looking for
so far. This small update suggestion is just another result from one
of my evolving scripts for the semantic patch language.

It was discussed under the topic “Comparing statement lists with SmPL”
to some degree.
https://systeme.lip6.fr/pipermail/cocci/2017-August/004388.html


>> @@ -104,22 +102,23 @@ static struct sync_file_info *sync_file_info(int fd)
>>  		info->num_fences = num_fences;
>>  
>>  		fence_info = calloc(num_fences, sizeof(*fence_info));
>> -		if (!fence_info) {
>> -			free(info);
>> -			return NULL;
>> -		}
>> +		if (!fence_info)
>> +			goto free_info;
>>  
>>  		info->sync_fence_info = (uint64_t)fence_info;
>>  
>>  		err = ioctl(fd, SYNC_IOC_FILE_INFO, info);
>>  		if (err < 0) {
>>  			free(fence_info);
> 
> Why not add a free_fence_info to make it consistent?

It did not add another jump label because it would be used only once
for this if branch (according to your enquiry).


>> -			free(info);
>> -			return NULL;
>> +			goto free_info;

Do you expect a second update approach for this source code place?

Regards,
Markus
