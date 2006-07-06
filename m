From: Henne <henne@nachtwindheim.de>
Date: Thu, 06 Jul 2006 20:54:57 +0000
Subject: Re: [KJ] [PATCH] fix legacy megaraid-driver to compile without
Message-Id: <44AD78A1.5010708@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44AD6A5A.5060403@nachtwindheim.de> <20060706131447.ed46c3cb.rdunlap@xenotime.net> <44AD73AD.5080402@nachtwindheim.de> <20060706204252.GV26941@stusta.de>
In-Reply-To: <20060706204252.GV26941@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: "Randy.Dunlap" <rdunlap@xenotime.net>, Neela.Kolli@engenio.com, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org

Adrian Bunk schrieb:
> On Thu, Jul 06, 2006 at 10:33:49PM +0200, Henne wrote:
>>>> From: Henrik Kretzschmar <henne@nachtwindheim.de>
>>>>
>>>> Create an empty inline function to make the legacy megaraid-driver compile
>>>> without PROC_FS.
>>>> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
>>>> ---
>>>>
>>>> --- linux-2.6.18-rc1/drivers/scsi/megaraid.h    2006-06-18 03:49:35.000000000 +0200
>>>> +++ linux/drivers/scsi/megaraid.h       2006-07-06 21:39:59.000000000 +0200
>>>> @@ -1039,6 +1039,9 @@
>>>>  static int proc_rdrv_30(char *, char **, off_t, int, int *, void *);
>>>>  static int proc_rdrv_40(char *, char **, off_t, int, int *, void *);
>>>>  static int proc_rdrv(adapter_t *, char *, int, int);
>>>> +#else
>>>> +static inline void
>>>> +mega_create_proc_entry(int index, struct proc_dir_entry *parent) {}
>>>>  #endif
>>>>
>>>>  static int mega_adapinq(adapter_t *, dma_addr_t);
>>> Already in -mm:
>>> http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.17/2.6.17-mm6/broken-out/drivers-scsi-megaraidc-add-a-dummy-mega_create_proc_entry-for-proc_fs=y.patch
>> Great, but isn't it better to put that define stuff into the headers?
> 
> No - the function itself is static (and has therefore itself no 
> prototype in any header).
> 
> If the function was global, I'd agree with you.
> 
>> Thanks and Greets,
>> Henne
> 
> cu
> Adrian
> 
The header I mean is /drivers/scsi/megaraid.h and is only used by megaraid.c.
And there are the prototypes, in dependency of CONFIG_PROC_FS, for all these other proc-related functions.
Thats why I decided to make the change there and not in megaraid.c .

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
