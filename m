From: walter harms <wharms@bfs.de>
Date: Thu, 30 May 2013 08:59:35 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <51A714F7.8030904@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 29.05.2013 23:15, schrieb Dan Carpenter:
> On Wed, May 29, 2013 at 07:34:39PM +0200, walter harms wrote:
> 
>> int would be a more "natural" choice.
>>
> 
> You should never use signed types for a bit field.  That's just
> asking for a sign expansion bug.

my idea was more to use unsigned int instead of u16.
Personally i try to avoid this (artificial) types as much as possible,

re,
 wh
