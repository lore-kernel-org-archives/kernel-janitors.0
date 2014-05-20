From: walter harms <wharms@bfs.de>
Date: Tue, 20 May 2014 08:50:46 +0000
Subject: Re: [PATCH 2/5] staging: lustre: lnet: socklnd: Clean up memset(...)
Message-Id: <537B1766.1090808@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400433557-24985-1-git-send-email-massa.nomura@gmail.com>	 <1400433557-24985-3-git-send-email-massa.nomura@gmail.com> <1400434032.21382.3.camel@joe-AO725>
In-Reply-To: <1400434032.21382.3.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Masaru Nomura <massa.nomura@gmail.com>, gregkh@linuxfoundation.org, andreas.dilger@intel.com, oleg.drokin@intel.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 18.05.2014 19:27, schrieb Joe Perches:
> On Sun, 2014-05-18 at 18:19 +0100, Masaru Nomura wrote:
>> Remove prohibited space and fix line over 80 characters of
>> memset(...) to meet kernel coding style.
> []
>> diff --git a/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c b/drivers/staging/lustre/lnet/klnds/socklnd/socklnd.c
> []
>> @@ -113,7 +113,7 @@ ksocknal_create_peer(ksock_peer_t **peerp, lnet_ni_t *ni, lnet_process_id_t id)
>>  	if (peer = NULL)
>>  		return -ENOMEM;
>>  
>> -	memset (peer, 0, sizeof (*peer));       /* NULL pointers/clear flags etc */
>> +	memset(peer, 0, sizeof(*peer));     /* NULL pointers/clear flags etc */
> 
> It looks like this memset is unnecessary
> as it's already zeroed by LIBCFS_ALLOC->
> LIBCFS_ALLOC_GFP->LIBCFS_ALLOC_POST->memset.
> 
> It seems as if all these ALLOC macros could
> use quite a bit of cleaning/sorting out.
> 

for a start,
some kind soul could replace the malloc()/memset() with zalloc().

re,
 wh





