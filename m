From: walter harms <wharms@bfs.de>
Date: Mon, 11 Jul 2005 15:55:33 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <42D29675.1030203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Domen Puncer wrote:
> On 11/07/05 11:53 +0200, walter harms wrote:
>>tmp_buffer = kmalloc(count + 1, GFP_KERNEL);
>>if (!tmp_buffer)
>>	return -ENOMEM;
>>
>>if ( copy_from_user(tmp_buffer, buffer, count) )
>>	result = -EFAULT;
>>
>>tmp_buffer[count] = 0;
>>result = item->write_func(tmp_buffer, count);
>>
>>
>>just for the paranoid:
>> should tmp_buffer be filled with \0 to avoid an information leak ?
>> (schroedinger bug ?)
> 
> We copy _from_ userspace.
> 

UPS, you are totaly right :)

ntl  perhaps add to the TODO list.

Check buffers that are used with copy_to_user() a really clean to avoid 
information leakage.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
