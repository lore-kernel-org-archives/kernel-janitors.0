From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:58:35 +0000
Subject: Re: [PATCH 2/3] arch/mips/net/bpf_jit.c: fix failure check
Message-Id: <CANZNk81DOOxYYFSKZMCh=uABd3ONB8wToTFc3_L_9TfyQDS1yQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405603655-12571-1-git-send-email-andrey.krieger.utkin@gmail.com>
        <53C7D52E.5020205@imgtec.com>
In-Reply-To: <53C7D52E.5020205@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, dborkman@redhat.com, ralf@linux-mips.org

2014-07-17 16:52 GMT+03:00 Markos Chandras <Markos.Chandras@imgtec.com>:
> Thanks for the patch. I would personally prefer to use a new signed int
> variable, but I am fine either way.

If that's not a problem for performance etc., then i'll resubmit with
new temporary signed variable, because i believe it would be simpler
to comprehend.

-- 
Andrey Utkin
