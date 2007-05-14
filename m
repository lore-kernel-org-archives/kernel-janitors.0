From: Arjan van de Ven <arjan@infradead.org>
Date: Mon, 14 May 2007 15:10:30 +0000
Subject: [KJ] Re: [RFC]__sock_create() change
Message-Id: <1179155430.19106.8.camel@laptopd505.fenrus.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <464816F9.90208@anaconda.cs.pub.ro>
In-Reply-To: <464816F9.90208@anaconda.cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2007-05-14 at 13:42 +0530, pradeep singh wrote:

> 
> But why would we want
> to issues warning only once and not each time the socket is created for SOCK_PAKCET type? 

because then a normal user can overflood the system log ;)



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
