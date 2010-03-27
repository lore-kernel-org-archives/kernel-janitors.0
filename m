From: David Howells <dhowells@redhat.com>
Date: Sat, 27 Mar 2010 13:28:37 +0000
Subject: Re: [PATCH 5/7] arch/powerpc/kernel: Use set_cpus_allowed_ptr
Message-Id: <18215.1269696517@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <18162.1269696414@redhat.com>
	<Pine.LNX.4.64.1003262303080.6480@ask.diku.dk>
In-Reply-To: <18162.1269696414@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: peterz@infradead.org, kernel-janitors@vger.kernel.org, oleg@redhat.com, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>, mingo@elte.hu, tglx@linutronix.de

David Howells <dhowells@redhat.com> wrote:

> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> 
> That URL doesn't appear to work:
> 
> Not Found
> The requested URL /) was not found on this server.
> Additionally, a 404 Not Found error was encountered while trying to use an ErrorDocument to handle the request.
> Apache/2.2.8 (Mandriva Linux/PREFORK-6mdv2008.1) Server at coccinelle.lip6.fr Port 80

Actually, it does.  It's just that my email client thought that the closing
bracket after it was part of the URL:-/

David
