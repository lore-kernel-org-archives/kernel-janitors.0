From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 15 Apr 2017 07:51:38 +0000
Subject: NFC-FDP: Completion of error handling around fdp_nci_i2c_read_device_properties()
Message-Id: <235c865e-b66f-9fb7-2f8e-93c62cacb988@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-wireless@vger.kernel.org, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Christophe Ricard <christophe.ricard@gmail.com>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Robert Dolca <robert.dolca@intel.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

I have noticed that the function “fdp_nci_i2c_read_device_properties” does not
contain a null pointer check after a call of the function “devm_kmalloc”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/nfc/fdp/i2c.c?h=v4.10#n234

How do you think about to add a corresponding check and adjust the function
return type there?

Regards,
Markus
