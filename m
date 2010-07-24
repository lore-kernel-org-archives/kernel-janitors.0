From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 24 Jul 2010 18:23:56 +0000
Subject: Re: check capabilities in open()
Message-Id: <20100724182355.GA9134@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100724160701.GA4907@albatros>
In-Reply-To: <20100724160701.GA4907@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 24, 2010 at 08:07:01PM +0400, Vasiliy Kulikov wrote:
> Hi,
> 
> I've found that some drivers check process capabilities via capable() in
> open(), not in ioctl()/write()/etc.
> 
> I cannot find answer in POSIX, but IMO process expects that file
> descriptors of priviledged user and file descriptors of the same
> file/device are the same in priviledge aspect. Driver should deny/allow
> open() and deny/allow ioctl() based on user priviledges. The path how
> the process gained this fd doesn't matter.
> 
> So I think these 2 examples should be equal:
> 
> 1) root process opened the file and then dropped its priviledges
> 
> 2) nonroot process opened the file

They most certainly should _not_.  Consider the following mechanism:
	process A authenticates itself to process B
	B is convinced to open a file that wouldn't be readable for A.
	B passes descriptor to A.
	A reads from it.
You are breaking that.
