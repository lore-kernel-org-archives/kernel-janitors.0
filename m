From: David Miller <davem@davemloft.net>
Date: Wed, 09 Jun 2010 23:19:14 +0000
Subject: Re: [patch] caif: fix a couple range checks
Message-Id: <20100609.161914.104048741.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607145158.GO5483@bicker>
	<81C3A93C17462B4BBD7E272753C10579169C4D9E64@EXDCVYMBSTM005.EQ1STM.local>
In-Reply-To: <81C3A93C17462B4BBD7E272753C10579169C4D9E64@EXDCVYMBSTM005.EQ1STM.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sjur.brandeland@stericsson.com
Cc: error27@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Wed, 9 Jun 2010 11:11:38 +0200

>> From: Dan Carpenter [mailto:error27@gmail.com]
>> 
>> The extra ! character means that these conditions are always false.
> 
> 
> Looks good, thanks. This is embarrassing, I should caught this ages ago.
> Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>

Applied, thanks guys.
