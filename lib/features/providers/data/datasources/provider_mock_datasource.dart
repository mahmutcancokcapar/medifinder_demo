import 'package:collection/collection.dart';
import 'package:medifinder_demo/features/providers/data/models/provider_model.dart';

abstract final class ProviderMockDatasource {
  static Future<List<ProviderModel>> getProviders() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return _data;
  }

  static Future<ProviderModel?> getProviderById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return _data.firstWhereOrNull((p) => p.id == id);
  }

  static final List<ProviderModel> _data = [
    const ProviderModel(
      id: 'p001',
      name: 'Dr. Ayşe Kaya',
      type: 'doctor',
      specialty: 'Cardiology',
      city: 'Istanbul',
      country: 'Turkey',
      rating: 4.8,
      reviewCount: 134,
      languages: ['Turkish', 'English'],
      isVerified: true,
      tags: ['cardiology', 'heart', 'istanbul'],
      phone: '+90 212 555 0101',
      email: 'ayse.kaya@medifinder.com',
      website: 'https://drayse.com',
      bio:
          'Cardiologist with 15+ years of experience at Istanbul Heart'
          ' Institute. Specializes in interventional cardiology and'
          ' preventive heart care.',
    ),
    const ProviderModel(
      id: 'p002',
      name: 'Dr. Mehmet Demir',
      type: 'doctor',
      specialty: 'Orthopedics',
      city: 'Ankara',
      country: 'Turkey',
      rating: 4.5,
      reviewCount: 89,
      languages: ['Turkish', 'German'],
      isVerified: true,
      tags: ['orthopedics', 'sports', 'ankara'],
      phone: '+90 312 444 0202',
      email: 'mehmet.demir@medifinder.com',
      bio:
          'Sports medicine and orthopedic surgery specialist. '
          'Team physician for national athletics federation.',
    ),
    const ProviderModel(
      id: 'p003',
      name: 'Acibadem Maslak Hospital',
      type: 'hospital',
      specialty: 'Multi-specialty',
      city: 'Istanbul',
      country: 'Turkey',
      rating: 4.7,
      reviewCount: 892,
      languages: ['Turkish', 'English', 'Arabic', 'Russian'],
      isVerified: true,
      tags: ['hospital', 'istanbul', 'international'],
      phone: '+90 212 304 4444',
      website: 'https://acibadem.com',
      bio:
          'JCI-accredited tertiary care hospital offering comprehensive '
          'medical services to international patients.',
    ),
    const ProviderModel(
      id: 'p004',
      name: 'Dr. Sarah Mitchell',
      type: 'doctor',
      specialty: 'Neurology',
      city: 'London',
      country: 'United Kingdom',
      rating: 4.9,
      reviewCount: 217,
      languages: ['English', 'French'],
      isVerified: true,
      tags: ['neurology', 'brain', 'london'],
      phone: '+44 20 7946 0958',
      email: 'sarah.mitchell@nhs.uk',
      website: 'https://drsarahmitchell.co.uk',
      bio:
          "Consultant neurologist at King's College Hospital with expertise "
          'in movement disorders and epilepsy management.',
    ),
    const ProviderModel(
      id: 'p005',
      name: 'London Skin Clinic',
      type: 'clinic',
      specialty: 'Dermatology',
      city: 'London',
      country: 'United Kingdom',
      rating: 4.6,
      reviewCount: 311,
      languages: ['English'],
      isVerified: true,
      tags: ['dermatology', 'skin', 'london', 'clinic'],
      phone: '+44 20 7123 4567',
      email: 'hello@londenskinclinic.com',
      website: 'https://londoskinclinic.com',
      bio:
          'Premier dermatology clinic in central London offering medical '
          'and cosmetic dermatology treatments.',
    ),
    const ProviderModel(
      id: 'p006',
      name: 'Dr. Hans Weber',
      type: 'doctor',
      specialty: 'Oncology',
      city: 'Berlin',
      country: 'Germany',
      rating: 4.7,
      reviewCount: 156,
      languages: ['German', 'English'],
      isVerified: true,
      tags: ['oncology', 'cancer', 'berlin'],
      email: 'h.weber@charite.de',
      bio:
          'Professor of Oncology at Charité – Universitätsmedizin Berlin. '
          'Research focus on targeted cancer therapies.',
    ),
    const ProviderModel(
      id: 'p007',
      name: 'Berliner Augenklinik',
      type: 'clinic',
      specialty: 'Ophthalmology',
      city: 'Berlin',
      country: 'Germany',
      rating: 4.4,
      reviewCount: 203,
      languages: ['German', 'English', 'Turkish'],
      isVerified: false,
      tags: ['ophthalmology', 'eye', 'berlin'],
      phone: '+49 30 1234 5678',
      website: 'https://berliner-augenklinik.de',
      bio:
          'Specialized eye care center offering laser surgery, '
          'cataract treatment, and pediatric ophthalmology.',
    ),
    const ProviderModel(
      id: 'p008',
      name: 'Dr. Fatima Al-Hassan',
      type: 'doctor',
      specialty: 'Pediatrics',
      city: 'Dubai',
      country: 'UAE',
      rating: 4.8,
      reviewCount: 98,
      languages: ['Arabic', 'English', 'Urdu'],
      isVerified: true,
      tags: ['pediatrics', 'children', 'dubai'],
      phone: '+971 4 345 6789',
      email: 'f.alhassan@medifinder.com',
      bio:
          'Pediatrician with 12 years of practice at Dubai Healthcare City. '
          'Subspecialty in neonatal care and pediatric infectious diseases.',
    ),
    const ProviderModel(
      id: 'p009',
      name: 'Emirates Hospital Dubai',
      type: 'hospital',
      specialty: 'Multi-specialty',
      city: 'Dubai',
      country: 'UAE',
      rating: 4.5,
      reviewCount: 541,
      languages: ['Arabic', 'English', 'Hindi', 'Urdu'],
      isVerified: true,
      tags: ['hospital', 'dubai', 'uae', 'international'],
      phone: '+971 4 349 5800',
      website: 'https://emirateshospital.ae',
      bio:
          'Full-service private hospital providing world-class healthcare '
          'to residents and medical tourists in the UAE.',
    ),
    const ProviderModel(
      id: 'p010',
      name: 'Dr. Marc Dubois',
      type: 'doctor',
      specialty: 'Psychiatry',
      city: 'Paris',
      country: 'France',
      rating: 4.3,
      reviewCount: 67,
      languages: ['French', 'English'],
      isVerified: false,
      tags: ['psychiatry', 'mental health', 'paris'],
      phone: '+33 1 42 00 1234',
      email: 'marc.dubois@cabinet-psy.fr',
      bio:
          'Psychiatrist specializing in anxiety disorders, depression, '
          'and cross-cultural mental health consultations.',
    ),
    const ProviderModel(
      id: 'p011',
      name: 'Dr. Zeynep Arslan',
      type: 'doctor',
      specialty: 'Gynecology',
      city: 'Istanbul',
      country: 'Turkey',
      rating: 4.6,
      reviewCount: 172,
      languages: ['Turkish', 'English'],
      isVerified: true,
      tags: ['gynecology', 'obstetrics', 'istanbul'],
      phone: '+90 212 666 0303',
      email: 'zeynep.arslan@medifinder.com',
      bio:
          'Obstetrician and gynecologist with special interest in '
          'high-risk pregnancies and minimally invasive surgery.',
    ),
    const ProviderModel(
      id: 'p012',
      name: 'Medikal Plus Clinic',
      type: 'clinic',
      specialty: 'General Practice',
      city: 'Ankara',
      country: 'Turkey',
      rating: 3.9,
      reviewCount: 45,
      languages: ['Turkish'],
      isVerified: false,
      tags: ['general practice', 'ankara', 'clinic'],
      phone: '+90 312 777 0404',
      bio:
          'Neighborhood outpatient clinic offering general medical '
          'consultations, routine check-ups and minor procedures.',
    ),
    const ProviderModel(
      id: 'p013',
      name: "Dr. James O'Brien",
      type: 'doctor',
      specialty: 'Cardiology',
      city: 'London',
      country: 'United Kingdom',
      rating: 0,
      reviewCount: 0,
      languages: ['English'],
      isVerified: false,
      tags: ['cardiology', 'london'],
      email: 'j.obrien@nhsft.uk',
      bio:
          "Newly registered cardiologist at St Thomas' Hospital. "
          'Research focus on cardiac imaging and echo-guided procedures.',
    ),
    const ProviderModel(
      id: 'p014',
      name: 'Dr. Layla Nasser',
      type: 'doctor',
      specialty: 'Endocrinology',
      city: 'Dubai',
      country: 'UAE',
      rating: 4.7,
      reviewCount: 83,
      languages: ['Arabic', 'English'],
      isVerified: true,
      tags: ['endocrinology', 'diabetes', 'dubai'],
      phone: '+971 4 789 0123',
      email: 'layla.nasser@medifinder.com',
      bio:
          'Endocrinologist with expertise in diabetes management, '
          'thyroid disorders and metabolic syndrome.',
    ),
    const ProviderModel(
      id: 'p015',
      name: 'Hôpital Américain de Paris',
      type: 'hospital',
      specialty: 'Multi-specialty',
      city: 'Paris',
      country: 'France',
      rating: 4.6,
      reviewCount: 728,
      languages: ['French', 'English', 'Arabic'],
      isVerified: true,
      tags: ['hospital', 'paris', 'international', 'american'],
      phone: '+33 1 46 41 25 25',
      website: 'https://american-hospital.org',
      bio:
          'Internationally accredited hospital serving the American '
          'community and international patients in Paris since 1906.',
    ),
    const ProviderModel(
      id: 'p016',
      name: 'Dr. Elena Müller',
      type: 'doctor',
      specialty: 'Dermatology',
      city: 'Berlin',
      country: 'Germany',
      rating: 4.5,
      reviewCount: 129,
      languages: ['German', 'English', 'Russian'],
      isVerified: true,
      tags: ['dermatology', 'skin', 'berlin'],
      phone: '+49 30 9876 5432',
      email: 'e.mueller@dermzentrum.de',
      bio:
          'Dermatologist and allergist focusing on inflammatory skin '
          'conditions, patch testing and biological therapies.',
    ),
    const ProviderModel(
      id: 'p017',
      name: 'Dr. Ali Hassan',
      type: 'doctor',
      specialty: 'Orthopedics',
      city: 'Dubai',
      country: 'UAE',
      rating: 4.2,
      reviewCount: 34,
      languages: ['Arabic', 'English'],
      isVerified: false,
      tags: ['orthopedics', 'spine', 'dubai'],
      phone: '+971 4 234 5678',
      bio:
          'Orthopedic surgeon specializing in spine surgery and '
          'joint replacement at Dubai Bone & Joint Center.',
    ),
    const ProviderModel(
      id: 'p018',
      name: 'Clinique du Parc',
      type: 'clinic',
      specialty: 'Rehabilitation',
      city: 'Paris',
      country: 'France',
      rating: 4.1,
      reviewCount: 57,
      languages: ['French'],
      isVerified: false,
      tags: ['rehabilitation', 'physio', 'paris'],
      phone: '+33 1 55 00 9900',
      website: 'https://cliniqueparc.fr',
      bio:
          'Physical therapy and rehabilitation center offering '
          'post-surgical recovery programs and sports rehabilitation.',
    ),
    const ProviderModel(
      id: 'p019',
      name: 'Dr. Burak Şahin',
      type: 'doctor',
      specialty: 'Neurology',
      city: 'Istanbul',
      country: 'Turkey',
      rating: 4.4,
      reviewCount: 78,
      languages: ['Turkish', 'English'],
      isVerified: true,
      tags: ['neurology', 'migraine', 'istanbul'],
      email: 'burak.sahin@medifinder.com',
      phone: '+90 212 888 0505',
      bio:
          'Neurologist with expertise in headache disorders, '
          'multiple sclerosis and neuro-immunological conditions.',
    ),
    const ProviderModel(
      id: 'p020',
      name: 'Berlin Fertility Center',
      type: 'clinic',
      specialty: 'Reproductive Medicine',
      city: 'Berlin',
      country: 'Germany',
      rating: 4.8,
      reviewCount: 186,
      languages: ['German', 'English', 'Spanish'],
      isVerified: true,
      tags: ['ivf', 'fertility', 'berlin', 'reproductive'],
      phone: '+49 30 5555 1234',
      email: 'info@berlinfertility.de',
      website: 'https://berlinfertility.de',
      bio:
          'Leading reproductive medicine clinic offering IVF, IUI '
          'and fertility preservation with high success rates.',
    ),
  ];
}
