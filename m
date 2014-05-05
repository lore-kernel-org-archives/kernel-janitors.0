From: "Luck, Tony" <tony.luck@intel.com>
Date: Mon, 05 May 2014 23:29:14 +0000
Subject: RE: [PATCH v2] x86/mce: Improve mcheck_init_device() error handling
Message-Id: <3908561D78D1C84285E8C5FCA982C28F327F8E9B@ORSMSX114.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1399151031-19905-1-git-send-email-mattieu.souchaud@free.fr>
In-Reply-To: <1399151031-19905-1-git-send-email-mattieu.souchaud@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Souchaud <mattieu.souchaud@free.fr>, "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

+err_device_create:
+	/*
+	 * mce_device_remove behave properly if mce_device_create was not
+	 * called on that device.
+	 */
+	for_each_possible_cpu(i)
+		mce_device_remove(i);

grammar comment "s/behave/behaves/"

Though perhaps this is better:

	/*
	 * We didn't keep track of which devices were created above, but
	 * even if we had, the set of online cpus might have changed.
	 * Play safe and remove for every possible cpu since mce_device_remove()
	 * will do the right thing.
	 */

-Tony
