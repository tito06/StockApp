class SearchStockResponse {
  int? id;
  String? name;
  String? symbol;
  String? createdAt;
  String? updatedAt;
  String? alpacaId;
  String? exchange;
  String? description;
  String? assetType;
  String? isin;
  String? industry;
  String? sector;
  int? employees;
  Null? website;
  Null? address;
  Null? netZeroProgress;
  Null? carbonIntensityScope3;
  Null? carbonIntensityScope1And2;
  Null? carbonIntensityScope1And2And3;
  Null? tempAlignmentScopes1And2;
  Null? dnshAssessmentPass;
  Null? goodGovernanceAssessment;
  Null? contributeToEnvironmentOrSocialObjective;
  Null? sustainableInvestment;
  Null? scope1Emissions;
  Null? scope2Emissions;
  Null? scope3Emissions;
  Null? totalEmissions;
  String? listingDate;
  Null? marketCap;
  int? ibkrConnectionId;
  Image? image;
  Null? createdBy;
  Null? updatedBy;

  SearchStockResponse(
      {this.id,
      this.name,
      this.symbol,
      this.createdAt,
      this.updatedAt,
      this.alpacaId,
      this.exchange,
      this.description,
      this.assetType,
      this.isin,
      this.industry,
      this.sector,
      this.employees,
      this.website,
      this.address,
      this.netZeroProgress,
      this.carbonIntensityScope3,
      this.carbonIntensityScope1And2,
      this.carbonIntensityScope1And2And3,
      this.tempAlignmentScopes1And2,
      this.dnshAssessmentPass,
      this.goodGovernanceAssessment,
      this.contributeToEnvironmentOrSocialObjective,
      this.sustainableInvestment,
      this.scope1Emissions,
      this.scope2Emissions,
      this.scope3Emissions,
      this.totalEmissions,
      this.listingDate,
      this.marketCap,
      this.ibkrConnectionId,
      this.image,
      this.createdBy,
      this.updatedBy});

  SearchStockResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    alpacaId = json['alpaca_id'];
    exchange = json['exchange'];
    description = json['description'];
    assetType = json['asset_type'];
    isin = json['isin'];
    industry = json['industry'];
    sector = json['sector'];
    employees = json['employees'];
    website = json['website'];
    address = json['address'];
    netZeroProgress = json['net_zero_progress'];
    carbonIntensityScope3 = json['carbon_intensity_scope_3'];
    carbonIntensityScope1And2 = json['carbon_intensity_scope_1_and_2'];
    carbonIntensityScope1And2And3 =
        json['carbon_intensity_scope_1_and_2_and_3'];
    tempAlignmentScopes1And2 = json['temp_alignment_scopes_1_and_2'];
    dnshAssessmentPass = json['dnsh_assessment_pass'];
    goodGovernanceAssessment = json['good_governance_assessment'];
    contributeToEnvironmentOrSocialObjective =
        json['contribute_to_environment_or_social_objective'];
    sustainableInvestment = json['sustainable_investment'];
    scope1Emissions = json['scope_1_emissions'];
    scope2Emissions = json['scope_2_emissions'];
    scope3Emissions = json['scope_3_emissions'];
    totalEmissions = json['total_emissions'];
    listingDate = json['listing_date'];
    marketCap = json['market_cap'];
    ibkrConnectionId = json['ibkr_connection_id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['alpaca_id'] = this.alpacaId;
    data['exchange'] = this.exchange;
    data['description'] = this.description;
    data['asset_type'] = this.assetType;
    data['isin'] = this.isin;
    data['industry'] = this.industry;
    data['sector'] = this.sector;
    data['employees'] = this.employees;
    data['website'] = this.website;
    data['address'] = this.address;
    data['net_zero_progress'] = this.netZeroProgress;
    data['carbon_intensity_scope_3'] = this.carbonIntensityScope3;
    data['carbon_intensity_scope_1_and_2'] = this.carbonIntensityScope1And2;
    data['carbon_intensity_scope_1_and_2_and_3'] =
        this.carbonIntensityScope1And2And3;
    data['temp_alignment_scopes_1_and_2'] = this.tempAlignmentScopes1And2;
    data['dnsh_assessment_pass'] = this.dnshAssessmentPass;
    data['good_governance_assessment'] = this.goodGovernanceAssessment;
    data['contribute_to_environment_or_social_objective'] =
        this.contributeToEnvironmentOrSocialObjective;
    data['sustainable_investment'] = this.sustainableInvestment;
    data['scope_1_emissions'] = this.scope1Emissions;
    data['scope_2_emissions'] = this.scope2Emissions;
    data['scope_3_emissions'] = this.scope3Emissions;
    data['total_emissions'] = this.totalEmissions;
    data['listing_date'] = this.listingDate;
    data['market_cap'] = this.marketCap;
    data['ibkr_connection_id'] = this.ibkrConnectionId;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Image {
  int? id;
  String? name;
  Null? alternativeText;
  Null? caption;
  int? width;
  int? height;
  Null? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  Null? previewUrl;
  String? provider;
  Null? providerMetadata;
  String? folderPath;
  String? createdAt;
  String? updatedAt;

  Image(
      {this.id,
      this.name,
      this.alternativeText,
      this.caption,
      this.width,
      this.height,
      this.formats,
      this.hash,
      this.ext,
      this.mime,
      this.size,
      this.url,
      this.previewUrl,
      this.provider,
      this.providerMetadata,
      this.folderPath,
      this.createdAt,
      this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    folderPath = json['folderPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alternativeText'] = this.alternativeText;
    data['caption'] = this.caption;
    data['width'] = this.width;
    data['height'] = this.height;
    data['formats'] = this.formats;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['size'] = this.size;
    data['url'] = this.url;
    data['previewUrl'] = this.previewUrl;
    data['provider'] = this.provider;
    data['provider_metadata'] = this.providerMetadata;
    data['folderPath'] = this.folderPath;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
