From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Thu, 27 Dec 2007 01:17:12 +0000
Subject: Re: [PATCH 1/3] arch/x86: Use offsetof
Message-Id: <20071227011712.GG27894@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261712450.1185@pc-041.diku.dk> <20071226194718.GB8844@elf.ucw.cz> <4772F972.7070802@zytor.com>
In-Reply-To: <4772F972.7070802@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pavel Machek <pavel@ucw.cz>, Julia Lawall <julia@diku.dk>, tglx@linutronix.de, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Dec 26, 2007 at 05:01:38PM -0800, H. Peter Anvin wrote:

> The right way to do it is:
> 
> 	memset(&info.vm86plus, 0, sizeof info.vm86plus);

If it's just one field _and_ we don't have padding we want to zero out -
certainly...
