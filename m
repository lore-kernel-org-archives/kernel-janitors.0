From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 May 2020 15:12:22 +0000
Subject: Re: [PATCH] i2c: puv3: Fix an error handling path in puv3_i2c_probe()
Message-Id: <dbdba794-a6d5-0f37-a675-389681b03c34@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506032824.191633-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200506032824.191633-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-i2c@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Guan Xuetao <gxt@pku.edu.cn>

> There is a spurious 'put_device()' in the remove function.

Do you find differences in the clean-up of system resources suspicious
between the implementations of the functions “puv3_i2c_remove” and “puv3_i2c_probe”?

Regards,
Markus
