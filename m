From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 30 Apr 2020 14:06:25 +0000
Subject: Re: checkpatch: Support for alternative quotation characters around commit title?
Message-Id: <dee7be7c-cbb9-688e-662a-34549d2df35a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429163645.GA13810@udknight>
 <4112ab7e-1f06-d880-e471-084c78bc84d4@web.de>
 <20200430125614.GA30691@udknight>
In-Reply-To: <20200430125614.GA30691@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> No, we don't need to support other quotation character for 'Fixes:' tag
> at least now. The submitting-patches.rst tells us the pretty format is:
> “...
> Fixes: %h (\"%s\")
> ...”

Can such a data structure still be correctly parsed if the commit title
would contain double quotes?

How do you think about to discuss delimiter variations?

Regards,
Markus
