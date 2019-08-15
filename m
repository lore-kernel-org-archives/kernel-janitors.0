From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 15 Aug 2019 13:50:38 +0000
Subject: Re: [v2 08/10] scripts: Coccinelle script for namespace dependencies
Message-Id: <1c4420f4-361c-7358-49d9-87d8a51f7920@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813121733.52480-9-maennich@google.com>
In-Reply-To: <20190813121733.52480-9-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Martijn Coenen <maco@android.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, kernel-team@android.com, usb-storage@lists.one-eyed-alien.net, x86@kernel.org, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Gilles Muller <Gilles.Muller@lip6.fr>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jessica Yu <jeyu@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kate Stewart <kstewart@linuxfoundation.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>

> +generate_deps_for_ns() {
> +    $SPATCH --very-quiet --in-place --sp-file \
> +	    $srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
> +}

* Where will the variable “srctree” be set for the file “scripts/nsdeps”?

* Would you like to support a separate build directory for desired adjustments?

* How do you think about to check error handling around such commands?


> +generate_deps() {
…
> +        for source_file in $mod_source_files; do
> +            sed '/MODULE_IMPORT_NS/Q' $source_file > ${source_file}.tmp
…

I suggest to assign the name for the temporary file to a variable
which should be used by subsequent commands.

Regards,
Markus
