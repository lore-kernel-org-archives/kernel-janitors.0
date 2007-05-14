From: Chris Wedgwood <cw@f00f.org>
Date: Mon, 14 May 2007 22:51:06 +0000
Subject: [KJ] Re: [RFC]__sock_create() change
Message-Id: <20070514225106.GA24009@tuatara.stupidest.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <464816F9.90208@anaconda.cs.pub.ro>
In-Reply-To: <464816F9.90208@anaconda.cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 14, 2007 at 08:10:30AM -0700, Arjan van de Ven wrote:

> because then a normal user can overflood the system log ;)

they can do that anyhow:

main()
{
    for (;;) {
        if (!fork())
	    *(char*)(0ul) = 1;
        sleep(1);
    }
}

would probably work pretty well on some platforms to overflow the
system log and not go noticed... (i'm sure if you look there are lots
of ways a local user can do similar things)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
