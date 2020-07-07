From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 07 Jul 2020 07:23:47 +0000
Subject: Re: [PATCH v2] proc/fd: Adjust variable initialisations in seq_show()
Message-Id: <e0c48e5a-650d-b475-abe8-32315f2b6ac9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200612160946.21187-1-pilgrimtao@gmail.com>
In-Reply-To: <20200612160946.21187-1-pilgrimtao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kaitao Cheng <pilgrimtao@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, Matthew Wilcox <willy@infradead.org>, Muchun Song <songmuchun@bytedance.com>

> 'files' will be immediately reassigned. 'f_flags' and 'file' will be
> overwritten in the if{} or seq_show() directly exits with an error.
> so we don't need to consume CPU resources to initialize them.

How do you think about to reduce the scope for four local variables
in this function implementation?
https://refactoring.com/catalog/reduceScopeOfVariable.html

Regards,
Markus
