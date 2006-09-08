From: Henk Vergonet <rememberme@god.dyndns.org>
Date: Fri, 08 Sep 2006 07:49:01 +0000
Subject: Re: [KJ] [PATCH] MIN/MAX cleanup
Message-Id: <20060908074901.GA341@god.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157631741.2452.30.camel@amol.teneoris.com>
In-Reply-To: <1157631741.2452.30.camel@amol.teneoris.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 07, 2006 at 05:52:21PM +0530, Amol Lad wrote:
> Cleanups done to use min/max macros from kernel.h. Handcrafted MIN/MAX
> macros in some drivers are changed to use macros from kernel.h
> 
> +      clength = MIN((word)(270-length),(word) (X[i].PLength-this->XOffset));

What is the rationale behind all those type casts?

Should we now also write:
	if(uint > (unsigned int)300) {
instead of
	if(uint > 300) {

Can someone explain this? 

- rme
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
