From: David Howells <dhowells@redhat.com>
Date: Mon, 24 Nov 2008 23:21:09 +0000
Subject: Re: [PATCH] CRED: fix sparse warnings
Message-Id: <5008.1227568869@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
In-Reply-To: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hannes Eder <hannes@hanneseder.net> wrote:

>   security/security.c:228:2: warning: returning void-valued expression
>   security/security.c:233:2: warning: returning void-valued expression
>   security/security.c:616:2: warning: returning void-valued expression

What's wrong with that?

David
