From: Yunfeng Ye <yeyunfeng@huawei.com>
Date: Fri, 08 May 2020 10:32:19 +0000
Subject: Re: [PATCH v2] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <5e8e9e2e-e7a0-a9f7-79d7-1b48d5f7a6ae@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189d719f-a8b8-6e10-ae2f-8120c3d2b7a9@huawei.com>
 <20200508093059.GF9365@kadam>
In-Reply-To: <20200508093059.GF9365@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux-kernel@vger.kernel.org, Markus.Elfring@web.de, kernel-janitors@vger.kernel.org, Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>



On 2020/5/8 17:30, Dan Carpenter wrote:
> On Fri, May 08, 2020 at 02:51:15PM +0800, Yunfeng Ye wrote:
>> diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
>> index 16b9a420e6fd..d034f86022b7 100644
>> --- a/tools/bootconfig/main.c
>> +++ b/tools/bootconfig/main.c
>> @@ -314,31 +314,33 @@ int apply_xbc(const char *path, const char *xbc_path)
>>  	ret = delete_xbc(path);
>>  	if (ret < 0) {
>>  		pr_err("Failed to delete previous boot config: %d\n", ret);
>> -		return ret;
>> +		goto free_data;
>>  	}
>>
>>  	/* Apply new one */
>>  	fd = open(path, O_RDWR | O_APPEND);
>>  	if (fd < 0) {
>>  		pr_err("Failed to open %s: %d\n", path, fd);
>> -		return fd;
>> +		ret = fd;
>> +		goto free_data;
>>  	}
>>  	/* TODO: Ensure the @path is initramfs/initrd image */
>>  	ret = write(fd, data, size + 8);
>>  	if (ret < 0) {
>>  		pr_err("Failed to apply a boot config: %d\n", ret);
>> -		return ret;
>> +		goto close_fd;
>>  	}
>>  	/* Write a magic word of the bootconfig */
>>  	ret = write(fd, BOOTCONFIG_MAGIC, BOOTCONFIG_MAGIC_LEN);
> 
> write returns the number of bytes written on success
> 
>> -	if (ret < 0) {
>> +	if (ret < 0)
>>  		pr_err("Failed to apply a boot config magic: %d\n", ret);
>> -		return ret;
>> -	}
>> +
>> +close_fd:
>>  	close(fd);
>> +free_data:
>>  	free(data);
>>
>> -	return 0;
>> +	return ret;
> 
> But we want to return zero on success.
> 
yes, I should set 'ret' to 0 before returning on success. thanks.

>>  }
> 
> Btw, these leaks are totally harmless.  This is a short running user
> space program with is going to immediately exit on error so the memory
> will be freed anyway.  But the benifit is to silence static checker
> warnings so that's useful.
> 
> regards,
> dan carpenter
> 
> 
> .
> 
