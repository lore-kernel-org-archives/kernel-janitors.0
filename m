From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 25 Jul 2010 09:23:54 +0000
Subject: Re: check capabilities in open()
Message-Id: <20100725092354.GA7728@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100724160701.GA4907@albatros>
 <20100724182355.GA9134@ZenIV.linux.org.uk>
 <20100725054511.GB9018@albatros>
In-Reply-To: <20100725054511.GB9018@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jul 25, 2010 at 09:45 +0400, Vasiliy Kulikov wrote:
> Btw, the list of such drivers is much smaller, some of them just return
> -EPERM and open() fails, it is OK. I'll resend more precise list soon.

The list is tiny:

arch/x86/kernel/apm_32.c
drivers/char/agp/frontend.c
drivers/char/apm-emulation.c

Aslo comment from drivers/cahr/apm-emulation.c:

/*
 * XXX - this is a tiny bit broken, when we consider BSD
 * process accounting.  If the device is opened by root, we
 * instantly flag that we used superuser privs. Who knows,
 * we might close the device immediately without doing a
 * privileged operation -- cevans
 */
