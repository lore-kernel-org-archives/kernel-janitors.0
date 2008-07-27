From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 27 Jul 2008 03:12:36 +0000
Subject: Re: [PATCH 1/14] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <20080727031236.GA17544@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217101474.6107.127.camel@inlin>
In-Reply-To: <1217101474.6107.127.camel@inlin>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jul 26, 2008 at 05:44:48PM -0700, David Miller wrote:
> That's why this hasn't been fixed yet, it's not such
> a trivial matter to convert.

And it should really be converted to the driver model (see
Documentation/PCI/pci.txt)

I think jgarzik has a bunch of these queued up somewhere for people to
test.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
