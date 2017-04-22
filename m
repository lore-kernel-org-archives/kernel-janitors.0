From: "Coelho, Luciano" <luciano.coelho@intel.com>
Date: Sat, 22 Apr 2017 07:02:23 +0000
Subject: Re: [PATCH] iwlwifi: pcie: off by one in iwl_trans_pcie_dyn_txq_alloc()
Message-Id: <1492844542.31741.127.camel@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421194619.sjc33647odsfkcfl@mwanda>
         <1492804774.19290.5.camel@sipsolutions.net>
         <20170421201200.4y4tzlxmktacskr6@mwanda>
In-Reply-To: <20170421201200.4y4tzlxmktacskr6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>
Cc: linuxwifi <linuxwifi@intel.com>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Sharon, Sara" <sara.sharon@intel.com>, "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

T24gRnJpLCAyMDE3LTA0LTIxIGF0IDIzOjEyICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBIZWguICBJIHJhY2VkIHRoaXMgb25lIHRocm91Z2ggdG8gc2VlIGlmIEkgY291bGQgYmVhdCB5
b3UgdG8gdGhlIHB1bmNoLg0KDQpZZWFoLCB0aGlzIHBhdGNoIGlzIGluIG91ciBpbnRlcm5hbCB0
cmVlLiAgQnV0IG1heWJlIHdlIGNhbiB0YWtlIERhbidzDQpmb3IgdXBzdHJlYW0gZm9yIGhpcyBl
ZmZvcnRzPyA6KQ0KDQotLQ0KQ2hlZXJzLA0KTHVjYS4