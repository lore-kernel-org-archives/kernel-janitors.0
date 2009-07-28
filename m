From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 28 Jul 2009 15:07:16 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and
Message-Id: <20090728150716.GH3711@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk> <20090728144123.GB13883@suse.de> <200907281701.43509.npalix@diku.dk>
In-Reply-To: <200907281701.43509.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Greg KH <gregkh@suse.de>, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 28, 2009 at 05:01:42PM +0200, Nicolas Palix wrote:
> Ok. So, I guess the pattern for the other typedef is to strip the _OBJECT
> suffix when present, and always add the prefix hv_, right ?

The 'pattern' is to look at what the code is doing and choose a sensible
name.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
