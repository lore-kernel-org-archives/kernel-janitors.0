From: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 26 Jul 2010 16:52:35 +0000
Subject: Re: check capabilities in open()
Message-Id: <20100726165235.GA3485@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100724160701.GA4907@albatros>
 <20100724182355.GA9134@ZenIV.linux.org.uk>
 <20100725054511.GB9018@albatros>
 <20100726112317.GB9185@thunk.org>
In-Reply-To: <20100726112317.GB9185@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ted Ts'o <tytso@mit.edu>, Al Viro <viro@ZenIV.linux.org.uk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 26, 2010 at 07:23 -0400, Ted Ts'o wrote:
> The reason why the apm device needed to sample the suser() bit is that
> it can be opened by root and non-root processes, but it wanted to
> extend the Unix/Linux paradigm that privileges are tested at open()
> time.
Yes, it's exactly that I mean, check at open() time and grand high or
less priviledges.

> 
> So this is a not a bug, but quite deliberately, by design.
If it is explicitly designed to check UID at open() time and to have 2
kinds of file descriptors - priviledged and nonpriviledged, I'm fine
with this.

I wanted kernel community to draw attention because this moment was
not obviously for me and I thought it was a design flaw. Now I'm pleased
with your explanation, thank you.
