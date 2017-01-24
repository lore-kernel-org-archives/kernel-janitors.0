From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Tue, 24 Jan 2017 02:15:05 +0000
Subject: Re: KVM: Fine-tuning for several function implementations
Message-Id: <1485224105.31460.1.camel@petrovitsch.priv.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
         <5e40aa05-ccdf-0995-e1c4-a331d1da998a@redhat.com>
         <a1a42521-ca5c-8bff-0121-d4b63fd570f3@users.sourceforge.net>
In-Reply-To: <a1a42521-ca5c-8bff-0121-d4b63fd570f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Cc: Radim =?UTF-8?Q?Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, 2017-01-23 at 10:48 +0100, SF Markus Elfring wrote:
[...]
> > The others are useless churn or they make the result uselessly
> > different from the rest of KVM code.
> 
> I got an other view about potential benefits around the suggested
> movements for error code settings.

Which is not explained here.

> Would others like to help in approaches for checking corresponding
> run time changes a bit more?

You propose the patch and others should do the work to get it accepted?

Kind regards,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at
