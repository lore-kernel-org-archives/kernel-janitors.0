From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Feb 2015 22:26:27 +0000
Subject: Re: [PATCH 1/1] staging: unisys: Remove allocation from declaration line
Message-Id: <20150210222627.GC27072@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150210130214.GA18429@sloth>
In-Reply-To: <20150210130214.GA18429@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Benjamin Romer <benjamin.romer@unisys.com>, David Kershner <david.kershner@unisys.com>, devel@driverdev.osuosl.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 10, 2015 at 02:02:14PM +0100, Quentin Lambert wrote:
> This patch removes allocation from declaration line because
> people are known to gloss over declarations.

Again, who are these lazy people, and why are they reading kernel code?

Please, it's ok to allocate things in the declaration line, don't make
these kinds of changes.

greg k-h
