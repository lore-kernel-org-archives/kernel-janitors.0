From: Greg KH <greg@kroah.com>
Date: Fri, 11 Jan 2008 22:36:51 +0000
Subject: Re: [PATCH 1/1] PCI: change procfs interface to use unlocked_ioctl
Message-Id: <20080111223651.GA5942@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4786E1CE.4080404@uece.br>
In-Reply-To: <4786E1CE.4080404@uece.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergio Luis <sergio@uece.br>
Cc: gregkh@suse.de, linux-kernel@vger.kernel.org, Mathieu Segaud <mathieu.segaud@regala.cx>, linux-pci@atrey.karlin.mff.cuni.cz, kernel-janitors@vger.kernel.org

On Fri, Jan 11, 2008 at 12:26:06AM -0300, Sergio Luis wrote:
> Change drivers/pci/proc.c to use the unlocked_ioctl handler instead of
> the ioctl one.

Thanks, but Mathieu Segaud <mathieu.segaud@regala.cx> just beat you to
this by a few hours with a patch he sent me :)

greg k-h
