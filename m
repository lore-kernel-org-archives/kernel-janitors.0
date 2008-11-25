From: James Morris <jmorris@namei.org>
Date: Tue, 25 Nov 2008 01:08:51 +0000
Subject: Re: [PATCH] CRED: fix sparse warnings
Message-Id: <alpine.LRH.1.10.0811251208100.18891@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
In-Reply-To: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 24 Nov 2008, Hannes Eder wrote:

> Impact: fix sparse warnings
> 
> Fix the following sparse warnings:
> 
>   security/security.c:228:2: warning: returning void-valued expression
>   security/security.c:233:2: warning: returning void-valued expression
>   security/security.c:616:2: warning: returning void-valued expression
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied to 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next

-- 
James Morris
<jmorris@namei.org>
