From: walter harms <wharms@bfs.de>
Date: Wed, 30 Jul 2008 15:57:01 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <48908F4D.2050805@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Hugo Vasconcelos Saldanha wrote:
> On Tue, Jul 29, 2008 at 8:27 PM, Alexander Beregalov
> <a.beregalov@gmail.com> wrote:
>> Looks good, but how can I know which value should it return in that case?
>>
> 
> I think you should specify an error code to return, letting the caller
> decide what to do with it.
> 

You need to know
* can it be fixed ? the kernel/cpuset.c clearly shows NO
i have an (wrong?) argument that can not be fixed.

* is it save to leave untouched ?
(no idea in that case).
if yes document there is a unknown argument syslog()
or panic()

in some cases it may even be useful to make a function void().

re,
 wh

