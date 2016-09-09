From: andrey_utkin@fastmail.com
Date: Fri, 09 Sep 2016 10:02:28 +0000
Subject: Re: [PATCH] [media] pci: constify vb2_ops structures
Message-Id: <20160909100228.bwepap5ujcsmglkw@zver>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473379158-17344-1-git-send-email-Julia.Lawall@lip6.fr>
 <20160909091741.re5ll3jelooeitpv@zver>
 <9947c295765da5bca33efda310e874e6@newmail.lip6.fr>
In-Reply-To: <9947c295765da5bca33efda310e874e6@newmail.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, kernel-janitors@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Sergey Kozlov <serjk@netup.ru>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, kernel-janitors-owner@vger.kernel.org

On 9 September 2016 12:34:57 EEST, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>Do you want the whole patch again, or would a patch on the new driver
>by itself be sufficient?  The changes in the different files are all
>independent.

I guess maintainers would want a single patch for everything in this
case. But don't take my word, ask/look what they say.
