From: mattieu.souchaud@free.fr
Date: Wed, 07 May 2014 09:33:52 +0000
Subject: Re: [PATCH v2] x86/mce: Improve mcheck_init_device() error handling
Message-Id: <2103538240.232636551.1399455232411.JavaMail.root@zimbra10-e2.priv.proxad.net>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20140506062710.GB25208@gmail.com>
References: <1399151031-19905-1-git-send-email-mattieu.souchaud@free.fr>
In-Reply-To: <1399151031-19905-1-git-send-email-mattieu.souchaud@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ingo Molnar <mingo@kernel.org>
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tony Luck <tony.luck@intel.com>

Ok, thanks, that's better. I'll put your modifications in the patch v3.

----- Mail original -----
De: "Ingo Molnar" <mingo@kernel.org>
À: "Tony Luck" <tony.luck@intel.com>
Cc: "Mathieu Souchaud" <mattieu.souchaud@free.fr>, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Envoyé: Mardi 6 Mai 2014 08:27:10
Objet: Re: [PATCH v2] x86/mce: Improve mcheck_init_device() error handling


* Luck, Tony <tony.luck@intel.com> wrote:

> +err_device_create:
> +	/*
> +	 * mce_device_remove behave properly if mce_device_create was not
> +	 * called on that device.
> +	 */
> +	for_each_possible_cpu(i)
> +		mce_device_remove(i);
> 
> grammar comment "s/behave/behaves/"
> 
> Though perhaps this is better:
> 
> 	/*
> 	 * We didn't keep track of which devices were created above, but
> 	 * even if we had, the set of online cpus might have changed.
> 	 * Play safe and remove for every possible cpu since mce_device_remove()
> 	 * will do the right thing.
> 	 */

and I guess:

s/cpu since/cpu, since/

?

Thanks,

	Ingo
