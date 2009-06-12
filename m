From: walter harms <wharms@bfs.de>
Date: Fri, 12 Jun 2009 10:14:11 +0000
Subject: Re: [PATCH] trivial: update the Kernel Janitors' web-page URL
Message-Id: <4A322A73.4040104@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1244761228-32644-1-git-send-email-markus.heidelberg@web.de> <alpine.LNX.2.00.0906121057240.7457@wotan.suse.de>
In-Reply-To: <alpine.LNX.2.00.0906121057240.7457@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Markus Heidelberg <markus.heidelberg@web.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Jiri Kosina schrieb:
> On Fri, 12 Jun 2009, Markus Heidelberg wrote:
> 
>> The former address cannot be resolved.
>>
>> Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
>> ---
>>  MAINTAINERS |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ccdb575..d37b6a0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3267,7 +3267,7 @@ F:	scripts/Makefile.*
>>  KERNEL JANITORS
>>  P:	Several
>>  L:	kernel-janitors@vger.kernel.org
>> -W:	http://www.kerneljanitors.org/
>> +W:	http://janitor.kernelnewbies.org/
>>  S:	Maintained
> 
> BTW, I haven't followed kernel janitors project for a while, is it still 
> active? Skimming through the web, I can see some TODOs from 2001, hence 
> the question :)
> 
> Thanks,
> 


the project is still active.

the last patch was yesterday:
<clip>
Trivial patch which adds the __init and __exit macros to the module_init /
module_exit functions to the following modules from drivers/mtd/
 devices/m25p80.c
 devices/slram.c
 linux version 2.6.30
 ftl.c
 nand/cafe_nand.c
 nand/cmx270_nand.c
<clip/>


re,
 wh
