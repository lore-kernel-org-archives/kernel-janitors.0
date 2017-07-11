From: David Howells <dhowells@redhat.com>
Date: Tue, 11 Jul 2017 12:28:50 +0000
Subject: Re: [bug report] isofs: Implement show_options
Message-Id: <11741.1499776130@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711101927.2d7cy5zlpxfby6eh@mwanda>
In-Reply-To: <20170711101927.2d7cy5zlpxfby6eh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

>    495          if (sbi->s_session != -1)       seq_printf(m, ",session=%u", sbi->s_session);
>                     ^^^^^^^^^^^^^^^^^^^^
> ->s_session is a u8 so it can't be -1

This should probably be 255 then.  It might make sense to initialise
popt->session to that too, rather than -1.

David
