From: Henne <henne@nachtwindheim.de>
Date: Fri, 07 Jul 2006 06:32:10 +0000
Subject: Re: [KJ] [PATCH] fix legacy megaraid-driver to compile without
Message-Id: <44ADFFEA.1060508@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44AD6A5A.5060403@nachtwindheim.de> <20060706131447.ed46c3cb.rdunlap@xenotime.net> <44AD73AD.5080402@nachtwindheim.de> <20060706204252.GV26941@stusta.de> <44AD78A1.5010708@nachtwindheim.de> <20060706215957.GX26941@stusta.de>
In-Reply-To: <20060706215957.GX26941@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: "Randy.Dunlap" <rdunlap@xenotime.net>, Neela.Kolli@engenio.com, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org

>> The header I mean is /drivers/scsi/megaraid.h and is only used by megaraid.c.
>> And there are the prototypes, in dependency of CONFIG_PROC_FS, for all these other proc-related functions.
>> Thats why I decided to make the change there and not in megaraid.c .
> 
> Prototypes for static functions don't belong into header files.
> 
> That this has been done in megaraid.h in the past is something that 
> should be cleaned up, not a good example.
> 
> cu
> Adrian
Allright,
thats that kind of answer I wanted to hear. :)

Thanks and Greets,
Henne


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
