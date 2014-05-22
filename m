From: James Cameron <quozl@laptop.org>
Date: Thu, 22 May 2014 21:57:50 +0000
Subject: Re: [PATCH] libertas: fix return value when processing invalid packet
Message-Id: <20140522215750.GF2161@us.netrek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
 <1400473875-22228-2-git-send-email-Julia.Lawall@lip6.fr>
 <5379FCD0.2030506@cogentembedded.com>
 <1400520341.3819.15.camel@dcbw.local>
 <1400761961.15674.4.camel@dcbw.local>
In-Reply-To: <1400761961.15674.4.camel@dcbw.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dcbw@redhat.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, kernel-janitors@vger.kernel.org, libertas-dev@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>

On Thu, May 22, 2014 at 07:32:41AM -0500, Dan Williams wrote:
> Nothing actually uses the return value yet, but we might as well
> make it correct, like process_rxed_802_11_packet() does for the
> same case.  Also ensure that if monitor mode is enabled (and
> thus process_rxed_802_11_packet() is called) that the debugging
> enter/leave functions are balanced.
> 
> Signed-off-by: Dan Williams <dcbw@redhat.com>

Reviewed-by: James Cameron <quozl@laptop.org>

-- 
James Cameron
http://quozl.linux.org.au/
