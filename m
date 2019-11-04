From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 04 Nov 2019 15:40:31 +0000
Subject: Re: [PATCH v6] coccicheck: Support search for SmPL scripts within selected directory hierarchy
Message-Id: <583d2524-6b29-487b-a000-9a764b5ecdec@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1572838555-12101-1-git-send-email-zhong.shiqi@zte.com.cn>
In-Reply-To: <1572838555-12101-1-git-send-email-zhong.shiqi@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhong Shiqi <zhong.shiqi@zte.com.cn>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Xue Zhihong <xue.zhihong@zte.com.cn>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> *Allow defining the environment variable “COCCI” as a directory to
> search SmPL scripts.
>
> *Start a corresponding file determination if it contains an acceptable
> path.
>
> *Update coccinelle.rst documents for use coccicheck with a directory
> selection

‣ Do you really insist to use an enumeration without alignment
  in your change description?

‣ Can the following third item be nicer?

  * Adjust software documentation for using coccicheck with
    a selected directory.


> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -100,8 +100,8 @@ Two other modes provide some common combinations of these modes.
…
> +Using Coccinelle with defalut value

Why did you repeat a typo?

How do you think about to use the section title “Using Coccinelle
with the default configuration”?


…
> +semantic patch. In that case, the variable must be initialized with
> +the name of the semantic patch to apply.

I prefer an other wording.

…, it should be set to the file name of the semantic patch to apply.


…
> +directory. In that case, the variable must be initialized with the name of

…, it should be set to the …


Will the presented case distinction need another adjustment
for the document outline?


…
>  Controlling Which Files are Processed by Coccinelle
…

Did you overlook another update candidate (which I tried to point out before)?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?id=a99d8080aaf358d5d23581244e5da23b35e340b9#n189
“…
COCCI variable may additionally be used to only apply a single
semantic patch as shown in the previous section.
…”


Regards,
Markus
