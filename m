From: Bron Gondwana <brong@fastmail.fm>
Date: Fri, 24 Aug 2007 01:43:20 +0000
Subject: Re: Ideas on column length in kernel "problem"?
Message-Id: <20070824014320.GA18488@brong.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
In-Reply-To: <20070823035442.6FD0DDA81F@mailserver7.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Thompson <postfail@hushmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 22, 2007 at 11:54:41PM -0400, Scott Thompson wrote:
> Many free (and not-free) mail clients wordwrap.  Hushmail wraps at 
> 68 (verified), Yahoo has options to wrap at a max of 99, and Gmail 
> was somewhere around 85-90 as I recall.  Not sure on other free / 
> inexpensive clients.  

<disclaimer>I work for them</disclaimer>

FastMail (http://fastmail.fm/) have a tickbox in the web interface
so you can turn off line-wrapping if you need to.
 
Otherwise, as other people have said, use direct SMTP (we don't allow
it for non-paying accounts, but do for all levels of paying user)
and use a sane local client (in my case mutt+offlineimap)

Bron.
