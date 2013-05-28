From: David Howells <dhowells@redhat.com>
Date: Tue, 28 May 2013 10:22:33 +0000
Subject: Re: [PATCH v2] arch: s390: appldata: using strncpy() and strnlen() instead of sprintf()
Message-Id: <4310.1369736553@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A32D81.2010105@asianux.com> <51A2CC07.5010100@asianux.com> <CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
In-Reply-To: <51A32D81.2010105@asianux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chen Gang <gang.chen@asianux.com>
Cc: dhowells@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, jang@linux.vnet.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Chen Gang <gang.chen@asianux.com> wrote:

> -		len = sprintf(buf, appldata_timer_active ? "1\n" : "0\n");
> +		strncpy(buf, appldata_timer_active ? "1\n" : "0\n",
> +			ARRAY_SIZE(buf));
> +		len = strnlen(buf, ARRAY_SIZE(buf));

Since the strings here are a fixed, preknown size, you should use memcpy (or
just fill in the array directly which would likely take fewer instructions
since the strings are so short and vary by one character) and hard-code the
length or use sizeof() instead of strnlen().

David
