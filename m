From: ebiederm@xmission.com (Eric W. Biederman)
Date: Tue, 12 Jun 2007 05:32:03 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memcpy(dest, src,
Message-Id: <m1vedtpwks.fsf@ebiederm.dsl.xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181616342.2282.8.camel@shani-win>
In-Reply-To: <1181616342.2282.8.camel@shani-win> (Shani Moideen's message of
	"Tue, 12 Jun 2007 08:15:41 +0530")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shani Moideen <shani.moideen@wipro.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Shani Moideen <shani.moideen@wipro.com> writes:

> Hi,
> Replacing memcpy(dest,src,PAGE_SIZE) with copy_page(dest,src) in
> arch/i386/kernel/machine_kexec.c.

Please no.

People get creative in copy_page (especially mmx_copy_page),
and this code path need something simple and stupid, that
will work every time, especially when things are messed up
elsewhere.

Ideally we would actually do all of the setup before this point.
but that is another issue entirely.

Eric
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
