From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Wed, 18 Jul 2007 22:24:46 +0000
Subject: netdev_priv()
Message-Id: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I'm starting to work on the change to netdev_priv() call to access the
priv field of the net_device structure. Is anybody already working on
this ?

Also, what is the best way to organize my patches: one per subsystem
(wireless, token ring, ...) or even more detailed which would imply a
lot more patches ?

Regards,

Thomas
