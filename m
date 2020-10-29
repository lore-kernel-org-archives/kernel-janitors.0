From: "Bharathi, Divya" <Divya.Bharathi@Dell.com>
Date: Thu, 29 Oct 2020 13:35:19 +0000
Subject: RE: [PATCH] MAINTAINERS: rectify DELL WMI SYSMAN DRIVERS section
Message-Id: <CY4PR19MB125445B8D71FFEF6E234D40285140@CY4PR19MB1254.namprd19.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201029114425.22520-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Limonciello, Mario" <Mario.Limonciello@dell.com>, "Ksr, Prasanth" <Prasanth.Ksr@dell.com>, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> 
> Commit e8a60aa7404b ("platform/x86: Introduce support for Systems
> Management Driver over WMI for Dell Systems") added a new section DELL
> WMI SYSMAN DRIVERS in MAINTAINERS, but slipped in a typo.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/platform/x86/dell-wmi-syman/*
> 
> Point the file entry to the right location and add an entry for its
> Documentation while at it.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Divya Bharathi <divya.bharathi@dell.com>
