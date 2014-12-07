From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Sun, 07 Dec 2014 20:41:28 +0000
Subject: Re: [PATCH 3/20] PCI: fix misspelling of current function in string
Message-Id: <87lhmj42h3.fsf@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
	<1417980062-25151-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-4-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Sun, 7 Dec 2014 20:20:45 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kernel-janitors@vger.kernel.org, joe@perches.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Dec 07 2014, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Replace a misspelled function name by %s and then __func__.
>
> The function name begins with pci, not cpci.
...
>  	result = cpci_hotplug_init(debug);
>  	if (result) {
> -		err("cpci_hotplug_init with error %d\n", result);
> +		err("%s with error %d\n", __func__, result);
>  		return result;
>  	}

This one seems to be a false positive; I think the err() is reporting on
the result from the call of the function which is indeed called
cpci_hotplug_init.

I just skimmed the rest quickly, but they seem ok.

Rasmus
