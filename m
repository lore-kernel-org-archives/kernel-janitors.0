From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 27 Jan 2004 21:26:08 +0000
Subject: Re: [Kernel-janitors] [PATCH] swim3.c - convert cli to spinlock
Message-Id: <20040127132608.528fc3d3.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040124035312.GA6136@masterofpi.org>
In-Reply-To: <20040124035312.GA6136@masterofpi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 23 Jan 2004 19:53:12 -0800 Timmy Yee <shoujun@masterofpi.org> wrote:

| Hi,
| 
| This patch replaces the cli function calls with the spinlock function calls
| for the swim3 driver.

Timmy,

I'm not going to use this.  I checked with the powermac people
and much more is needed to make swim3 work and they have patched
code already.

Thanks,
--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
