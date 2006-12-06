From: "=?ISO-8859-1?Q?Daniel_Marjam=E4ki?=" <daniel.marjamaki@gmail.com>
Date: Wed, 06 Dec 2006 07:35:41 +0000
Subject: [KJ] what is best: memcpy or for
Message-Id: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello!

I am wondering if there is any real difference between "for" and "memcpy"..

    int i, a[100], b[100];

    // method 1
    for (i = 0; i < 100; i++)
        a[i] = b[i];

    // method 2
    memcpy(a, b, sizeof(a));

Is there any difference in speed?

With a good compiler, the output should be the same for both methods,
shouldn't it?

Best regards,
Daniel
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
