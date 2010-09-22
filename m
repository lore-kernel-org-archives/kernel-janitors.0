From: David Vrabel <david.vrabel@csr.com>
Date: Wed, 22 Sep 2010 11:36:29 +0000
Subject: Re: [PATCH 13/14] uwb: fix device_register() error handling
Message-Id: <4C99EA3D.7050405@csr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900918-24770-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284900918-24770-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Vasiliy Kulikov wrote:
> If device_register() fails then call put_device().
> See comment to device_register.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: David Vrabel <david.vrabel@csr.com>

What's the preferred way of handling these sorts of patch sets?  Merged
via some kernel-janitor tree or is it expected that subsystem
maintainers pick up the individual patches?

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/


Member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom
