From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Thu, 02 Nov 2006 09:59:13 +0000
Subject: Re: [KJ] cleaning of the definition of HANDLE_STACK
Message-Id: <82faac5b0611020159y518acca1v8951d774231b88cf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2aac3c260611011219w79c2a734q2be4bc9cdc21c6a1@mail.gmail.com>
In-Reply-To: <2aac3c260611011219w79c2a734q2be4bc9cdc21c6a1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

G'day Giangiacomo

On 11/2/06, Giangiacomo Mariotti <giangiacomo.mariotti@gmail.com> wrote:
> This is my new version of a patch that I've already posted in kernel-janitors.

-	} while (0)
+	}while(0)

This version seems to have an un-related white space change.

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
