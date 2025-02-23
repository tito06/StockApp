import 'dart:convert';

class StockDetailResponse {
  final int? id;
  final String? name;
  final String? symbol;
  final String? createdAt;
  final String? updatedAt;
  final String? alpacaId;
  final String? exchange;
  final String? description;
  final String? assetType;
  final String? isin;
  final String? industry;
  final String? sector;
  final int? employees;
  final String? website;
  final String? address;
  final String? netZeroProgress;
  final int? carbonIntensityScope3;
  final int? carbonIntensityScope1And2;
  final int? carbonIntensityScope1And2And3;
  final String? tempAlignmentScopes1And2;
  final bool? dnshAssessmentPass;
  final bool? goodGovernanceAssessment;
  final bool? contributeToEnvironmentOrSocialObjective;
  final bool? sustainableInvestment;
  final int? scope1Emissions;
  final int? scope2Emissions;
  final int? scope3Emissions;
  final int? totalEmissions;
  final String? listingDate;
  final String? marketCap;
  final int? ibkrConnectionId;
  final double? price;
  final double? changePercent;
  final List<dynamic>? holdings; // Changed to List<dynamic>
  final List<dynamic>? sectorAllocation; // Changed to List<dynamic>
  final int? sustainableInvestmentHoldingPercentage;
  final bool? inPortfolio;

  StockDetailResponse({
    this.id,
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
    this.price,
    this.changePercent,
    this.holdings,
    this.sectorAllocation,
    this.sustainableInvestmentHoldingPercentage,
    this.inPortfolio,
  });

  factory StockDetailResponse.fromJson(Map<String, dynamic> json) {
    return StockDetailResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      alpacaId: json['alpaca_id'] as String?,
      exchange: json['exchange'] as String?,
      description: json['description'] as String?,
      assetType: json['asset_type'] as String?,
      isin: json['isin'] as String?,
      industry: json['industry'] as String?,
      sector: json['sector'] as String?,
      employees: json['employees'] as int?,
      website: json['website'] as String?,
      address: json['address'] as String?,
      netZeroProgress: json['net_zero_progress'] as String?,
      carbonIntensityScope3: json['carbon_intensity_scope_3'] as int?,
      carbonIntensityScope1And2: json['carbon_intensity_scope_1_and_2'] as int?,
      carbonIntensityScope1And2And3:
          json['carbon_intensity_scope_1_and_2_and_3'] as int?,
      tempAlignmentScopes1And2:
          json['temp_alignment_scopes_1_and_2'] as String?,
      dnshAssessmentPass: json['dnsh_assessment_pass'] as bool?,
      goodGovernanceAssessment: json['good_governance_assessment'] as bool?,
      contributeToEnvironmentOrSocialObjective:
          json['contribute_to_environment_or_social_objective'] as bool?,
      sustainableInvestment: json['sustainable_investment'] as bool?,
      scope1Emissions: json['scope_1_emissions'] as int?,
      scope2Emissions: json['scope_2_emissions'] as int?,
      scope3Emissions: json['scope_3_emissions'] as int?,
      totalEmissions: json['total_emissions'] as int?,
      listingDate: json['listing_date'] as String?,
      marketCap: json['market_cap'] as String?,
      ibkrConnectionId: json['ibkr_connection_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      changePercent: (json['change_percent'] as num?)?.toDouble(),
      holdings: json['holdings'] as List<dynamic>?, // Fixed
      sectorAllocation: json['sector_allocation'] as List<dynamic>?, // Fixed
      sustainableInvestmentHoldingPercentage:
          json['sustainable_investment_holding_percentage'] as int?,
      inPortfolio: json['in_portfolio'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'alpaca_id': alpacaId,
      'exchange': exchange,
      'description': description,
      'asset_type': assetType,
      'isin': isin,
      'industry': industry,
      'sector': sector,
      'employees': employees,
      'website': website,
      'address': address,
      'net_zero_progress': netZeroProgress,
      'carbon_intensity_scope_3': carbonIntensityScope3,
      'carbon_intensity_scope_1_and_2': carbonIntensityScope1And2,
      'carbon_intensity_scope_1_and_2_and_3': carbonIntensityScope1And2And3,
      'temp_alignment_scopes_1_and_2': tempAlignmentScopes1And2,
      'dnsh_assessment_pass': dnshAssessmentPass,
      'good_governance_assessment': goodGovernanceAssessment,
      'contribute_to_environment_or_social_objective':
          contributeToEnvironmentOrSocialObjective,
      'sustainable_investment': sustainableInvestment,
      'scope_1_emissions': scope1Emissions,
      'scope_2_emissions': scope2Emissions,
      'scope_3_emissions': scope3Emissions,
      'total_emissions': totalEmissions,
      'listing_date': listingDate,
      'market_cap': marketCap,
      'ibkr_connection_id': ibkrConnectionId,
      'price': price,
      'change_percent': changePercent,
      'holdings': holdings,
      'sector_allocation': sectorAllocation,
      'sustainable_investment_holding_percentage':
          sustainableInvestmentHoldingPercentage,
      'in_portfolio': inPortfolio,
    };
  }
}
