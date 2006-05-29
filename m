From: walter harms <wharms@bfs.de>
Date: Mon, 29 May 2006 11:09:58 +0000
Subject: Re: [KJ] [PATCH] Storage class should be first
Message-Id: <447AD686.7060402@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060528165759.GA1614@neon.tklauser.home>
In-Reply-To: <20060528165759.GA1614@neon.tklauser.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

some compilers have problems (i remeber icc patches). ntl is is good 
practise to defne the storage class before anything else. Simply to help 
reading.

re,
  wh

dan ost wrote:
> On 5/28/06, Tobias Klauser <tklauser@nuerscht.ch> wrote:
>> Storage class should be before const
> 
> Is this a requirement of C that gcc is forgiving of or is this
> just good practice?
> 
> --Dan Ost
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
