From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 13:38:59 +0000
Subject: re: net: dsa: hellcreek: Add support for hardware timestamping
Message-Id: <7c4b526c-b229-acdf-d22a-2bf4a206be5b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>, Kurt Kanzenbach <kurt@linutronix.de>, Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, ivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi

Static analysis on linux-next with Coverity has detected a potential
null pointer dereference issue on the following commit:

commit f0d4ba9eff75a79fccb7793f4d9f12303d458603
Author: Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>
Date:   Tue Nov 3 08:10:58 2020 +0100

    net: dsa: hellcreek: Add support for hardware timestamping

The analysis is as follows:

323                /* Get nanoseconds from ptp packet */
324                type = SKB_PTP_TYPE(skb);

   4. returned_null: ptp_parse_header returns NULL (checked 10 out of 12
times).
   5. var_assigned: Assigning: hdr = NULL return value from
ptp_parse_header.

325                hdr  = ptp_parse_header(skb, type);

   Dereference null return value (NULL_RETURNS)
   6. dereference: Dereferencing a pointer that might be NULL hdr when
calling hellcreek_get_reserved_field.

326                ns   = hellcreek_get_reserved_field(hdr);
327                hellcreek_clear_reserved_field(hdr);

This issue can only occur if the type & PTP_CLASS_PMASK is not one of
PTP_CLASS_IPV4, PTP_CLASS_IPV6 or PTP_CLASS_L2.  I'm not sure if this is
a possibility or not, but I'm assuming that it would be useful to
perform the null check just in case, but I'm not sure how this affects
the hw timestamping code in this function.

Colin
