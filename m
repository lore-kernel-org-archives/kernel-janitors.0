From: Yunfeng Ye <yeyunfeng@huawei.com>
Date: Fri, 08 May 2020 06:41:31 +0000
Subject: Re: [PATCH] tools/bootconfig: fix resource leak in apply_xbc()
Message-Id: <9359694c-57bf-729f-593f-6e25c4b115f6@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <63755ce8-5e1b-6c54-2f74-649cc2546371@web.de>
In-Reply-To: <63755ce8-5e1b-6c54-2f74-649cc2546371@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hewenliang <hewenliang4@huawei.com>, Shiyuan Hu <hushiyuan@huawei.com>



On 2020/5/8 4:30, Markus Elfring wrote:
>> The @data and @fd is leak in the error path of apply_xbc(), so this
>> patch fix it.
> 
> I suggest to improve this change description.
> 
> * Please use an imperative wording.
> 
> * Would you like to add the tag “Fixes”?
> 
> 
>> +++ b/tools/bootconfig/main.c
>> @@ -314,6 +314,7 @@  int apply_xbc(const char *path, const char *xbc_path)
>>  	ret = delete_xbc(path);
>>  	if (ret < 0) {
>>  		pr_err("Failed to delete previous boot config: %d\n", ret);
>> +		free(data);
>>  		return ret;
>>  	}
> 
> I propose to adjust the exception handling.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?idn7f2eacf09811d092c1b41263108ac7fe0d089d#n450
> 
> -		return ret;
> +		goto free_data;
> 
> 
>> @@ -321,24 +322,26 @@ int apply_xbc(const char *path, const char *xbc_path)
>>  	fd = open(path, O_RDWR | O_APPEND);
>>  	if (fd < 0) {
>>  		pr_err("Failed to open %s: %d\n", path, fd);
>> +		free(data);
>>  		return fd;
> 
> -		return fd;
> +		ret = fd;
> +		goto free_data;
> 
> 
>>  	}
>>  	/* TODO: Ensure the @path is initramfs/initrd image */
>>  	ret = write(fd, data, size + 8);
>>  	if (ret < 0) {
>>  		pr_err("Failed to apply a boot config: %d\n", ret);
>> -		return ret;
>> +		goto out;
> 
> +		goto free_data;
> 
> 
>>  	}
>>  	/* Write a magic word of the bootconfig */
>>  	ret = write(fd, BOOTCONFIG_MAGIC, BOOTCONFIG_MAGIC_LEN);
>>  	if (ret < 0) {
> 
> -	if (ret < 0) {
> +	if (ret < 0)
> 
> 
>>  		pr_err("Failed to apply a boot config magic: %d\n", ret);
>> -		return ret;
>> +		goto out;
> 
> I suggest to avoid an extra jump at such a place.
> 
> 
>>  	}
> 
> -	}
> +
> 
> 
>> +out:
> 
> +close_fd:
>>  	close(fd);
> 
> +free_data:
>>  	free(data);
> 
> 
> How do you think about to complete the error handling also at other
> source code places?
> 
ok, I will modify and send the patch v2, thanks.

> Regards,
> Markus
> 
> 
